from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['POST', 'GET'])
def handle_request():
    # Print the request method and body
    print(f"Received {request.method} request")
    if request.data:
        print("Request Body:")
        print(request.data.decode('utf-8'))
    else:
        print("No request body received.")

    # Return a mock response
    response_data = {
        "status": "success",
        "message": "Request received and processed."
    }
    return jsonify(response_data), 200

if __name__ == '__main__':
    # Run the server on localhost:5000
    app.run(host='0.0.0.0', port=5000, debug=True)
