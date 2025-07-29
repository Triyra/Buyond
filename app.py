# from flask import Flask, render_template, request, redirect, url_for, session

# app = Flask(__name__)
# app.secret_key = 'secretkey'

# @app.route('/')
# def index():
#     return render_template('index.html')

# @app.route('/products')
# def products():
#     return render_template('products.html')

# @app.route('/cart')
# def cart():
#     return render_template('cart.html')

# @app.route('/about')
# def about():
#     return render_template('about.html')

# @app.route('/contact')
# def contact():
#     return render_template('contact.html')

# if __name__ == '__main__':
#     app.run(debug=True)

from flask import Flask, render_template

app = Flask(__name__)
app.secret_key = 'secretkey'

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
