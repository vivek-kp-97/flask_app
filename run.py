from flask import Flask, request, json

app = Flask(__name__)

@app.route('/', methods = ['POST'])
def accept_route():
    data = request.json
    print("Receive:\n",data)
    return data

if __name__ == '__main__':
    app.run(host = '0.0.0.0', debug=True)


'''  
In order to test the above code, please use the below curl command or use equivalent request from Postman.
curl -X POST -H "Content-Type:application/json" -d '{"name":"Vivek KP"}' http://localhost:5000/
'''
