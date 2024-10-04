
# Chat Application in Flutter: Real-Time Chatting with Integrated Bot  

Welcome to the Chat Application, an innovative platform designed to redefine the way we communicate! 
This application is a blend of cutting-edge technology and user-centric design, aimed at facilitating real-time chatting while integrating a simple chatbot. Built with Flutter and powered by Firebase, this app provides a seamless and engaging user experience, making it the perfect choice for anyone looking to explore automated conversations with a bot.  

# overview

This Application aims for Realtime Chatting with Integrated Bot. 
one can easily login and use this Application.Basically,I made a chat app first in Flutter using Firebase and then integrated a 
bot into it and then implemented Real Time Chatting!  

# Key Features  

🌐 Real-Time Messaging: Communicate instantly with the integrated chatbot, ensuring a smooth and uninterrupted conversation flow.  

🤖 Integrated Chatbot: Engage with an intelligent bot that responds to user's simple questions in real time, making conversations more dynamic and informative.  

🔒 Secure User Authentication: Log in effortlessly using Google authentication, ensuring the security of user data while providing a smooth onboarding experience.  

🌙 Light and Dark Mode: Users can switch between light and dark themes effortlessly, catering to their personal preferences and enhancing readability.  

⚙️ Comprehensive Settings Management: Customize your profile with a user-friendly interface, including profile image uploads, nickname settings, and personal descriptions.  

📱 User-Centric Design: Built with Flutter, the app offers a responsive design that adapts seamlessly to different screen sizes, providing an optimal experience on both mobile and tablet devices


## API Reference

#### Get all items

```http
  https://rapidapi.com/lemur-engine-lemur-engine-default/api/lemurbot
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | LemurBot from rapidapi for Simple Conversations. |  

## 🛠️ Technologies Used

- Flutter
- Firebase (Firestore, Authentication, Storage)
- Dart
- RapidAPI (LemurBot)





## Approach and Implementation

**Splash Page**  

splash screen of this app  shows a welcome message and a loading indicator for 5 seconds before checking if the user is logged in. Based on their login status, it navigates them to either the home page(if user is logged in) or the login page(if user is not logged in).
I used stateful widget to change its appearence according to user interaction. 

**Login Page**  

Here,first authentication status of user is checked,if the user is not signed in,they can sign in via google login.  
After signing in,they are redirected to home page.  

**Home Page**  

This HomePage is the central hub of the chat app. It manages user authentication, provides options to access settings and a chatbot, and handles navigation and scroll events.user can also choose light or dark mode.It consists of a Scaffold with a toggleable app bar that allows switching between light and dark themes.  

**Settings Page**  

This SettingsPage code provides a user-friendly interface for managing personal settings, including uploading a profile image, entering a nickname, and sharing about oneself. It effectively utilizes Flutter's state management through the Provider package, integrates Firebase for image storage, and leverages custom constants for consistency. The structured layout ensures smooth interactions, enhancing the overall user experience in my chat application.  

**Chatting Page**  

This is the part Where I spent most of my time.The Chatpage in this  application integrates a seamless chat experience, allowing users to communicate with a chatbot. It leverages Firestore for real-time message storage and retrieval, ensuring messages are displayed promptly. The implementation of a REST API call to retrieve bot responses enhances user interaction, with built-in error handling and retry logic for robustness. Overall, this screen exemplifies effective use of state management and external APIs, delivering a dynamic chatting environment.  

you can get details of API in API Reference.  


**MAIN FUNCTION**  

The main function initializes the Flutter application with Firebase services.The MyApp class sets up a multi-provider environment, integrating authentication and settings management through the AuthProvider and SettingProvider.  

So,Basically The main function serves as the entry point for the Flutter application.The app is Well Prepared for Further Development.










## 🙏Acknowledgements

 - Special thanks to [The Programming Club,IIT INDORE](http://progclub.iiti.ac.in/) for their support and guidance.
 - Acknowledgment to [Coding Cafe](https://www.youtube.com/playlist?list=PLxefhmF0pcPm1rsPMBNaivKmr_jY2dewJ) for the helpful tutorials.
 - Thanks to the developers of [rapidapi](https://rapidapi.com/hub) for providing a robust API for our chatbot.


  

## Screenshots

![WhatsApp Image 2024-10-04 at 12 29 46_138c3d3c](https://github.com/user-attachments/assets/bd0c552c-0b44-4095-9463-fcc4f3801fa6) 

![WhatsApp Image 2024-10-04 at 12 28 47_b2b6c084](https://github.com/user-attachments/assets/fb2fe82b-4909-4579-9b22-355b1288cb06) 

![WhatsApp Image 2024-10-04 at 12 28 47_d949fbf2](https://github.com/user-attachments/assets/f15ac37c-4145-4b61-8f65-8b9455d110fd)

![WhatsApp Image 2024-10-04 at 12 35 20_8ed8e566](https://github.com/user-attachments/assets/04d3350d-2a33-4b55-ad1b-3bba1db10794)  

![WhatsApp Image 2024-10-04 at 12 29 23_52619e92](https://github.com/user-attachments/assets/72d0bf3e-676f-45b0-8d28-96d47a5e7c8e) 

![WhatsApp Image 2024-10-04 at 12 29 32_3e363f4f](https://github.com/user-attachments/assets/7e856128-17ac-41f3-9668-48ca56e89ba7)  

## 📖 Usage Instructions

1. Launch the app on your device.
2. Sign in using Google authentication.
3. Start a chat by sending messages in the chat interface.
4. Interact with the chatbot for responses.

## 🚧 Features Roadmap

- Integration of voice chat capabilities.
- Adding support for multiple languages.
- Enhanced user analytics and engagement features.

## 🚀 About Me
I'm a 2nd year Student at IIT INDORE,Pursuing Mechanical Engineering.  



## 🔗 Links

[![linkedin](https://www.linkedin.com/in/harsh-anand-58aab52b8?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)](https://www.linkedin.com/)
[![twitter](https://x.com/keen_otter?t=q4AHX_r0yWVGzxA-DybJGw&s=08)](https://twitter.com/)  









