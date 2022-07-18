from flask import Flask #importing the module
app=Flask(__name__) #instantiating flask object
@app.route('/') #defining a route in the application
def func(): #writing a function to be executed 
       return 'Hi bhargav'
if __name__=='__main__': #calling  main 
       # app.debug=True #setting the debugging option for the application instance
       app.run(host='0.0.0.0') #launching the flask's integrated development webserver