# Import the imigra- libraries, yes, libraries
import os
import tkinter as tk
from PIL import ImageTk, Image

# Define root window
root=tk.Tk()

# Placeholder callable func
def func():
    print("ello lov")

# Create root widndow (and lock size an shit ykyk)
root.title("GameHub(tm) application game chooser(tm)")
root.geometry('1280x720')
root.resizable(width=False, height=False)
root.iconbitmap('res/icon/icon_s.ico')
root['bg'] = '#0D0D0D'

# Generate layout frames and place with a grid
logoframe = tk.Frame(root, width=1280, height=120)
logoframe.grid(row=0,column=0, padx=0, pady=0)
logoframe['bg'] = '#0D0D0D'
gameframe = tk.Frame(root, width=1280, height=600)
gameframe.grid(row=1, column=0, padx=0, pady=0)
gameframe['bg'] = '#0D0D0D'

# Drawing the logo
logoimg = ImageTk.PhotoImage(Image.open('res/icon/logo_fullsize.png'))
logo = tk.Label(logoframe, image=logoimg)
logo.grid(row=0, column=0, padx=0, pady=0)

# Generate and place game buttons
btn1=tk.Button(gameframe,text="game 1", width=60,height=12,command=func)
btn2=tk.Button(gameframe,text="game 2", width=60,height=12,command=func)
btn3=tk.Button(gameframe,text="game 3", width=60,height=12,command=func)
btn1.grid(row=0,column=0, padx=60, pady=30)
btn2.grid(row=1,column=0, padx=60, pady=30)
btn3.grid(row=1,column=1, padx=60, pady=30)

# Useless code, do not use
#btn1.place(x=60,y=180)
#btn2.place(x=60,y=440)
#btn3.place(x=440,y=700)

# Closing statement, make the entire thing work so dont touch lmao
root.mainloop()
