<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🎙️ Deployment Link](#deployment-link)
  - [🎙️ Project Description](#project-description)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Run server](#run-server)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 🪙🪙🪙  BUDGETIFY <a name="about-project"></a>

**BUDGETIFY** is a robust Ruby on Rails application designed to simplify your culinary experience on managing bidget. The Ruby on Rails capstone project is about building a mobile web application where you can have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## 🎙️Deployment Link<a name="deployment-link"></a>
[Deployment Link](https://budgetify-1kup.onrender.com)

## 🎙️Project Description<a name="project-description"></a>
[Project Video Description](https://www.loom.com/share/cf02f39c3b424fb7b751c88638f384d4?sid=fb87e1c8-ae16-4a5a-a7c9-54c8e15669c8)
## 🛠 Built With <a name="built-with"></a>
Ruby on Rails, Visual Studia Code, WSL

### Tech Stack <a name="tech-stack"></a>

- **Ruby on Rails**
- **PostgreSQL**
- **WSL**

### Key Features <a name="key-features"></a>

- **User Registration and Login**
- **Category Spending Overview**
- **User-Friendly Interface**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

### Setup <a name="setup"></a>

In order to use this project.. Clone this repository to your desired folder by pasting this command in your command line interface:

🔗  https://github.com/Kaiserabbas/Budgetify.git

### Prerequisites <a name="prerequisites"></a>

💎  Ruby on Rails &  Git

### Install <a name="install"></a>

To install the project's dependencies, run:

```
bundle install
rails db:migrate
```

### Run server <a name="run-server"></a>
```
rails server
```
If you are asked to confirm user after registeration 

```
rails console 
```
```
user = User.find_by(email: 'example@example.com')
user.update_columns(confirmed_at: Time.current)
```

### Run tests <a name="run-tests"></a>

To test, run:

```
rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Qaisar Abbas**
- GitHub: [@Qaisar](https://github.com/Kaiserabbas)
- LinkedIn: [Qaisar](https://www.linkedin.com/in/qaisar-abbas-21a93840/)

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Expense Reminder**
- [ ] **Finicial Insights**
- [ ] **Budget Wizards**
- [ ] **Mobile App**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Kindly give this project a star if you like it.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>
"I would like to extend our heartfelt appreciation to Gregoire Vella for the original design idea that inspired this project. His innovative work, showcased on Behance, served as the guiding light for our creative endeavor. We honor and respect the Creative Commons license by giving due credit to the remarkable vision and ingenuity of Gregoire Vella."
I would also like to thank Microverse.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](/LICENSE) license.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
