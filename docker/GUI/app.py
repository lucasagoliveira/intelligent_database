import tkinter
import customtkinter



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
            text="Left Button 1",  # dar display no return da funcao
            font=("Arial", 20),
            width=button_size, 
            height=button_size, 
            command=self.left_button_1_action
        )
        self.left_button_1.grid(row=0, column=0, padx=10, pady=10)

        self.left_button_2 = customtkinter.CTkButton(
            self.left_button_frame, 
            text="Left Button 2", # dar display no return da funcao
            font=("Arial", 20),
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
            text="Right Button 1", # dar display no return da funcao
            font=("Arial", 20),
            width=button_size, 
            height=button_size, 
            command=self.right_button_3_action
        )
        self.right_button_3.grid(row=0, column=0, padx=10, pady=10)

        self.right_button_4 = customtkinter.CTkButton(
            self.right_button_frame, 
            text="Right Button 2", # dar display no return da funcao
            font=("Arial", 20),
            width=button_size, 
            height=button_size, 
            command=self.right_button_4_action
        )
        self.right_button_4.grid(row=1, column=0, padx=10, pady=10)


        # --- CENTER PANEL ---

        # Read-only text box
        self.read_only_box = customtkinter.CTkTextbox(self, font=("Arial", 20))
        self.read_only_box.grid(row=0, column=1, padx=20, pady=(20, 10), sticky="nsew")
        self.read_only_box.insert("0.0", "This is a read-only text box.\nYou cannot edit this text.")
        self.read_only_box.tag_config("user", foreground="#8888ff")
        self.read_only_box.tag_config("ai", foreground="#66cc66")
        self.read_only_box.configure(state="disabled")

        # Writable input box
        self.writable_box = customtkinter.CTkEntry(
            self, placeholder_text="What would you like to ask?", font=("Arial", 20),
            height = 40
        )
        self.writable_box.grid(row=2, column=1, padx=20, pady=(10, 5), sticky="nsew")
        self.writable_box.bind("<Return>", lambda event: self.submit_text())


        # Submit button
        self.submit_button = customtkinter.CTkButton(
            self, text="Submit", command=self.submit_text, width=100, height=30, font=("Arial", 20)
        )
        self.submit_button.grid(row=3, column=1, padx=20, pady=(5, 20), sticky="e")


# -- Button actions

    def left_button_1_action(self):
        #randomQuery1()
        print("Left Button 1 clicked")

    def left_button_2_action(self):
        #randomQuery2()
        print("Left Button 2 clicked")

    def right_button_3_action(self):
        #randomQuery3()
        print("Right Button 3 clicked")

    def right_button_4_action(self):
        #randomQuery4()
        print("Right Button 4 clicked")

# -- submit logic
    def submit_text(self):
        input_text = self.writable_box.get()

        self.read_only_box.configure(state="normal")  # Temporarily enable editing

        if input_text == "":
            self.read_only_box.insert("end", f"\nuser: {input_text}", "user")
            self.read_only_box.insert("end", f"\nAI: Please enter a valid question", "ai")
        else:
            answer = "This is a simulated response from the AI."
            self.read_only_box.insert("end", f"\nuser: {input_text}", "user")
            self.read_only_box.insert("end", f"\nAI: {answer}", "ai")
            self.writable_box.delete(0, "end")

        self.read_only_box.configure(state="disabled")  # Re-disable textbox



if __name__ == "__main__":
    app = App()
    app.mainloop()