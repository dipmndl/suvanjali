from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/category/<cat_type>')
def category(cat_type):
    categories = {
        'wedding': ('Wedding/Banquet Hall', 'Elegant venues perfect for your special day.', 50000),
        'meeting': ('Meeting Hall', 'Professional meeting spaces for all your business needs.', 20000),
        'guest': ('Guest Room', 'Comfortable guest rooms with modern amenities.', 10000)
    }
    if cat_type in categories:
        category_title, category_description, rent = categories[cat_type]
        return render_template('category.html', category_title=category_title, category_description=category_description, rent=rent)
    else:
        return "Category not found", 404

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        # Handle form submission
        pass
    return render_template('contact.html')

if __name__ == '__main__':
    app.run(debug=True)