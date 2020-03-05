#!/bin/python
import tkinter as tk
from tkinter import messagebox

def close_window (): 
    gui.destroy()

def left_position():  
    with open("/home/kokotin/.monitor_position", 'w') as file:
        file.write('1\n')
    messagebox.showinfo('Message', "You've chosen left/up position!")  

def right_position():  
    with open("/home/kokotin/.monitor_position", 'w') as file:
        file.write('2\n')
    messagebox.showinfo('Message', "You've chosen right/down position!") 


if __name__ == "__main__":
    gui = tk.Tk()  
    gui.geometry("200x211")  
    gui.title('Monitor position')
    gui.config(bg='#282a36')

    var = tk.StringVar()
    label = tk.Label(gui, textvariable=var, justify=tk.CENTER, wraplength=150, bg='#282a36', fg='#ffffff')
    var.set("Choose the position of your second monitor!")
    label.pack(fill=tk.X)

    button_l = tk.Button(gui,
                        text = 'LEFT/UP',
                        height = 3,
                        command = left_position,
                        bg='#282a36', fg='#ffffff') 
    button_l.pack(fill=tk.X)  

    button_r = tk.Button(gui,
                        text = 'RIGHT/DOWN',
                        height = 3,
                        command = right_position,
                        bg='#282a36', fg='#ffffff') 
    button_r.pack(fill=tk.X) 

    button_exit = tk.Button(gui,
                        text = 'EXIT',
                        height = 3,
                        command = close_window,
                        bg='#282a36', fg='#ffffff') 
    button_exit.pack(fill=tk.X)

    gui.mainloop()
    