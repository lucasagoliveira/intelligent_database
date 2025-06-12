# inteligent_database

### How to run the server

1. Install Docker on:
- Windows: https://www.docker.com/products/docker-desktop/
- Linux: ```curl -fsSL https://get.docker.com | sh```
2. Initialize Docker.
3. Extract LUGARES21_PORTUGAL.zip into the "docker" folder and rename the extracted "LUGARES21_PORTUGAL.gpkg" to "LUGARES21_PORTUGAL.sqlite"
4. Build docker and run it. Using the script:
- `run.sh` on Linux
- `run.bat` on Windows

### How to run the GUI client

1. Open a terminal and run te following command:
```sh
pip install requirements.txt

python3 app.py
```

2. To use the app you can ask questions on the writable text box and press the "Enter" key or click on the "Submit" button. The app will respond with the answer to your question.

3. You can also click the side buttons to see another random fact about Portugal.

4. To get the full list of available commands, type 'help' in the text box and press "Enter" or click the "Submit" button.
4.1 You must type exatcly the command as it is shown in the list, otherwise the app will not recognize it.

### How to compare time of execution
1. Open a terminal and run the following command:
```sh
python3 graph.py
```
