from flask import Flask, request, jsonify
import janus_swi as janus
import time


app = Flask(__name__)

# Consult main.pl once at startup
janus.consult('main.pl')

@app.route('/prolog', methods=['GET'])
def prolog_health_check():
    return jsonify({'status': 'OK'})

@app.route('/prolog', methods=['POST'])
def prolog_query():
    data = request.get_json()
    user_input = data.get('input', '')
    if not user_input:
        return jsonify({'error': 'No input provided'}), 400
    # Query Prolog using get_answer/2
    start_time = time.time()
    result = janus.query_once("get_answer(Input, Response)", {"Input": user_input})
    end_time = time.time()
    execution_time = (end_time - start_time) * 1000
    print(f"Execution time: {execution_time:.2f} ms")
    # Extract the response string
    response = result.get('Response', '') if isinstance(result, dict) else str(result)
    return jsonify({'result': response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
