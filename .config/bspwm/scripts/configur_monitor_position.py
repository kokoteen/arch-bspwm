#!/bin/python
import tkinter as tk
from tkinter import messagebox

gui = tk.Tk()  
gui.geometry('400x150')  
gui.title('PythonExamples.org - Tkinter Example')

def close_window (): 
    gui.destroy()

def showMsg():  
    messagebox.showinfo('Message', 'You clicked the Submit button!')

# frame = tk.Frame(gui)
# frame.pack()

button = tk.Button(gui,
	text = 'Submit',
	command = close_window) 

button.pack() 
button.place(anchor='n',bordermode='OUTSIDE')  
  
gui.mainloop()

#place() over pack() and grid()