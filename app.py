from tkinter import *
import customtkinter
import requests
import random

class App(customtkinter.CTk):
    def __init__(self):
        super().__init__()
        


        # configure window
        self.title("Intelligent Database Assistant")
        
        # Set the window size to fullscreen
        self.geometry(f"{1500}x{800}")

        # configure grid layout
        self.grid_columnconfigure(0, weight=1)   # Left
        self.grid_columnconfigure(1, weight=15)   # Center (wider)
        self.grid_columnconfigure(2, weight=1)   # Right

        self.grid_rowconfigure(0, weight=5)   # Read-only textbox (biggest area)
        self.grid_rowconfigure(1, weight=1)   # Spacer
        self.grid_rowconfigure(2, weight=0)   # Writable entry
        self.grid_rowconfigure(3, weight=0)   # Submit button


        # Define button size
        button_size = 300


        # LEFT BUTTON FRAME
        self.left_button_frame = customtkinter.CTkFrame(self)
        self.left_button_frame.grid(row=0, column=0, rowspan=3, padx=10, pady=20, sticky="nsew")
        self.left_button_frame.grid_rowconfigure((0, 1), weight=1)
        self.left_button_frame.grid_columnconfigure(0, weight=1)

        self.left_button_1 = customtkinter.CTkButton(
            self.left_button_frame, 
            text="Click me",  # dar display no return da funcao
            font=("Courier", 20),
            width=button_size, 
            height=button_size, 
            command=self.left_button_1_action
        )
        self.left_button_1.grid(row=0, column=0, padx=10, pady=10)

        self.left_button_2 = customtkinter.CTkButton(
            self.left_button_frame, 
            text="Click me", # dar display no return da funcao
            font=("Courier", 20),
            width=button_size, 
            height=button_size, 
            command=self.left_button_2_action
        )
        self.left_button_2.grid(row=1, column=0, padx=10, pady=10)


        # RIGHT BUTTON FRAME
        self.right_button_frame = customtkinter.CTkFrame(self)
        self.right_button_frame.grid(row=0, column=2, rowspan=3, padx=10, pady=20, sticky="nsew")
        self.right_button_frame.grid_rowconfigure((0, 1), weight=1)
        self.right_button_frame.grid_columnconfigure(0, weight=1)

        self.right_button_3 = customtkinter.CTkButton(
            self.right_button_frame, 
            text="Click me", # dar display no return da funcao
            font=("Courier", 20),
            width=button_size, 
            height=button_size, 
            command=self.right_button_3_action
        )
        self.right_button_3.grid(row=0, column=0, padx=10, pady=10)

        self.right_button_4 = customtkinter.CTkButton(
            self.right_button_frame, 
            text="Click me", # dar display no return da funcao
            font=("Courier", 20),
            width=button_size, 
            height=button_size, 
            command=self.right_button_4_action
        )
        self.right_button_4.grid(row=1, column=0, padx=10, pady=10)


        # --- CENTER PANEL ---

        # Read-only text box
        self.read_only_box = customtkinter.CTkTextbox(self, font=("Courier", 20))
        self.read_only_box.grid(row=0, column=1, padx=20, pady=(20, 10), sticky="nsew")
        self.read_only_box.insert("0.0", "System: Send \'help\' to see available commands.", "system")
        self.read_only_box.tag_config("user", foreground="#8888ff")
        self.read_only_box.tag_config("ai", foreground="#66cc66")
        self.read_only_box.tag_config("system", foreground="#fffa66")
        self.read_only_box.configure(state="disabled")

        # Writable input box
        self.writable_box = customtkinter.CTkEntry(
            self, placeholder_text="What would you like to ask?", font=("Courier", 20),
            height = 40
        )
        self.writable_box.grid(row=2, column=1, padx=20, pady=(10, 5), sticky="nsew")
        self.writable_box.bind("<Return>", lambda event: self.submit_text())


        #clear button
        self.clear_button = customtkinter.CTkButton(
            self, text="Clear", command=self.clear_action, width=100, height=30, font=("Courier", 20), fg_color="#e43939", hover_color="#a30f0f"
        )
        self.clear_button.grid(row=3, column=1, padx=20, pady=(5, 20), sticky="w")

        # Submit button
        self.submit_button = customtkinter.CTkButton(
            self, text="Submit", command=self.submit_text, width=100, height=30, font=("Courier", 20)
        )
        self.submit_button.grid(row=3, column=1, padx=20, pady=(5, 20), sticky="e")


#clear button action
    def clear_action(self):
        self.read_only_box.configure(state="normal")
        self.read_only_box.delete("1.0", "end")
        self.read_only_box.insert("0.0", "System: Send 'help' to see available commands.", "system")
        self.read_only_box.configure(state="disabled")



# -- Button actions

    def left_button_1_action(self):
        self.left_button_1.configure(text = self.wrap_text(self.randomQuery(1,7), 20))

    def left_button_2_action(self):
        self.left_button_2.configure(text = self.wrap_text(self.randomQuery(8,19), 20))

    def right_button_3_action(self):
        self.right_button_3.configure(text = self.wrap_text(self.randomQuery(20,31), 20))

    def right_button_4_action(self):
        self.right_button_4.configure(text = self.wrap_text(self.randomQuery(32,39), 20))

# -- submit logic
    def submit_text(self):
        input_text = self.writable_box.get()

        self.read_only_box.configure(state="normal")  # Temporarily enable editing

        if input_text == "":
            pass

        elif input_text == "help":
            
            self.read_only_box.insert("end", f"\n\nuser: {input_text}", "user")
            self.read_only_box.insert("end", f"\nSystem: {self.system_help_message()}", "system")
            self.writable_box.delete(0, "end")
        else:
            answer = self.ask_prolog(input_text)
            if answer.split(" ")[0] == "table":
                answer = self.format_table(answer.replace(") (", "@").replace(")", "").split("@")[1:])
            self.read_only_box.insert("end", f"\n\nuser: {input_text}", "user")
            self.read_only_box.insert("end", f"\nAI: {answer}", "ai")
            self.writable_box.delete(0, "end")

        self.read_only_box.see("end")  # Scroll to the end
        self.read_only_box.configure(state="disabled")  # Re-disable textbox

    # -- Accessory functions
    
    def format_table(self, data_list):
        """
        Receives a list of names (strings or tuples) and returns a string formatted as an ASCII table.
        Example input: ["Porto", "Lisbon", "Braga"] or [("Porto",), ("Lisbon",), ("Braga",)]
        """
        # Normalize input: flatten if list of tuples
        names = [item[0] if isinstance(item, (tuple, list)) else item for item in data_list]
        if not names:
            return "(No data)"
        # Determine column width
        max_len = max(len(str(name)) for name in names)
        col_width = max(max_len, 4)
        # Build table
        header = f"| {'City':<{col_width}} |"
        sep = f"+-{'-'*col_width}-+"
        rows = [f"| {str(name):<{col_width}} |" for name in names]
        table = '\n'.join([sep, header, sep] + rows + [sep])
        return '\n' +table
    
    def wrap_text(self, text, max_chars_per_line):
        words = text.split()
        lines = []
        current_line = ""
        for word in words:
            if len(current_line) + len(word) + 1 > max_chars_per_line:
                lines.append(current_line)
                current_line = word
            else:
                if current_line:
                    current_line += " "
                current_line += word
        if current_line:
            lines.append(current_line)
        return "\n".join(lines)
    
    def ask_prolog(self, query) -> str:
        try:
            response = requests.post(
                'http://localhost:8000/prolog',
                json={'input': query}
            )
            if response.ok:
                return response.json().get('result', 'No result')
            else:
                return f"Error: {response.status_code}"
        except requests.exceptions.RequestException as e:
            return f"Request failed: {e}"
        
    def randomQuery(self, inicio, fim) -> str:
        question = random.randint(inicio, fim)
        match question:
            case 1:
                query = "what is the biggest city in Portugal?"
            case 2:
                query = "what is the smallest city in Portugal?"
            case 3:
                query = "what is the most northern city in Portugal?"
            case 4:
                query = "what is the most southern city in Portugal?"
            case 5:
                query = "what is the most eastern city in Portugal?"
            case 6:
                query = "what is the most western city in Portugal?"
            case 7:
                query = "what is the highest city in Portugal?"
            case 8:
                query = "how many people live in Porto?"
            case 9:
                query = "how many accommodations are there in Porto?"
            case 10:
                query = "what is the area of Porto?"
            case 11:
                query = "what is the length of Porto?"
            case 12:
                query = "how many people live in Lisboa?"
            case 13:
                query = "how many accommodations are there in Lisboa?"
            case 14:
                query = "what is the area of Lisboa?"
            case 15:
                query = "what is the length of Lisboa?"
            case 16:
                query = "how many people live in Braga?"
            case 17:
                query = "how many accommodations are there in Braga?"
            case 18:
                query = "what is the area of Braga?"
            case 19:
                query = "what is the length of Braga?"
            case 20:
                query = "how many people live in Coimbra?"
            case 21:
                query = "how many accommodations are there in Coimbra?"
            case 22:
                query = "what is the area of Coimbra?"
            case 23:
                query = "what is the length of Coimbra?"
            case 24:
                query = "how many people live in Aveiro?"
            case 25:
                query = "how many accommodations are there in Aveiro?"
            case 26:
                query = "what is the area of Aveiro?"
            case 27:
                query = "what is the length of Aveiro?"
            case 28:
                query = "how many people live in Faro?"
            case 29:
                query = "how many accommodations are there in Faro?"
            case 30:
                query = "what is the area of Faro?"
            case 31:
                query = "what is the length of Faro?"
            case 32:
                query = "how many people live in Funchal?"
            case 33:
                query = "how many accommodations are there in Funchal?"
            case 34:
                query = "what is the area of Funchal?"
            case 35:
                query = "what is the length of Funchal?"
            case 36:
                query = "how many people live in Guarda?"
            case 37:
                query = "how many accommodations are there in Guarda?"
            case 38:
                query = "what is the area of Guarda?"
            case 39:
                query = "what is the length of Guarda?"
            
        return self.ask_prolog(query)

    def system_help_message(self): #TODO: Insert all available commands
        text = "Available commands:\n\n"
        text += "1.Simple questions:\n"
        text += "- how many people live in [city]?\n"
        text += "- how many accommodations are there in [city]?\n"
        text += "- what is the area of [city]?\n"
        text += "- what is the length of [city]?\n"
        text += "\n"
        text += "2.Comparative questions:\n"
        text += "- between [cityA] and [cityB] what city is the biggest in population?\n"
        text += "- between [cityA] and [cityB] what city is the smallest in population?\n"
        text += "- between [cityA] and [cityB] what city is the biggest in area?\n"
        text += "- between [cityA] and [cityB] what city is the smallest in area?\n"
        text += "- between [cityA] and [cityB] what city is the biggest in length?\n"
        text += "- between [cityA] and [cityB] what city is the smallest in length?\n"
        text += "- between [cityA] and [cityB] what city is the biggest in accommodations?\n"
        text += "- between [cityA] and [cityB] what city is the smallest in accommodations?\n"
        text += "\n"
        text += "3.Superlative questions (absolute):\n"
        text += "- what are the [Number] biggest cities in population?\n"
        text += "- what are the [Number] smallest cities in population?\n"
        text += "- what are the [Number] biggest cities in area?\n"
        text += "- what are the [Number] smallest cities in area?\n"
        text += "- what are the [Number] biggest cities in length?\n"
        text += "- what are the [Number] smallest cities in length?\n"
        text += "- what are the [Number] biggest cities in accommodation?\n"
        text += "- what are the [Number] smallest cities in accommodation?\n"
        text += "- what is the biggest city in Portugal?\n"
        text += "- what is the smallest city in Portugal?\n"
        text += "- what is the most northern city in Portugal?\n"
        text += "- what is the most southern city in Portugal?\n"
        text += "- what is the most eastern city in Portugal?\n"
        text += "- what is the most western city in Portugal?\n"
        text += "- what is the highest city in Portugal?\n"
        text += "\n"
        text += "4.Superlative questions (percentage):\n"
        text += "- what are the [Number] percent biggest cities in population?\n"
        text += "- what are the [Number] percent smallest cities in population?\n"
        text += "- what are the [Number] percent biggest cities in area?\n"
        text += "- what are the [Number] percent smallest cities in area?\n"
        text += "- what are the [Number] percent biggest cities in length?\n"
        text += "- what are the [Number] percent smallest cities in length?\n"
        text += "- what are the [Number] percent biggest cities in accommodation?\n"
        text += "- what are the [Number] percent smallest cities in accommodation?\n"
        text += "\n"
        text += "Attention: all the commands are case sensitive, but all the city names start with upper letters!"
        return text
        
        
if __name__ == "__main__":
    app = App()
    app.mainloop()