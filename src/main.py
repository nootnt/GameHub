import tkinter as tk

root=tk.Tk(screenName="selector",  baseName=None,  className="Tk",  useTk=1)

def func():
    print("ello lov")

root.geometry('1280x720')
root.resizable(width=False, height=False)
btn=tk.Button(root,text="Click deez", width=10,height=5,command=func)
btn.place(x=200,y=30)

root.mainloop()
