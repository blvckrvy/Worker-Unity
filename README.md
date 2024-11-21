USER GUIDE 
INTRODUCTION 
This guide provides a comprehensive overview of the Worker Unity app, detailing its 
purpose, installation, key features, navigation. 
INSTALLATION AND SETUP 
1. Download the application’s APK from the provided repository link. 
https://github.com/blvckrvy/Worker-Unity 
2. Install the application on your Android device. 
3. Open the app and sign up or log in using your credentials. 
KEY FEATURES 
1. View Tasks: 
✓ Displays tasks assigned to the logged-in worker.  
✓ Highlights overdue tasks and provides options for action. 
2. Task Actions: 
✓ Accept: Mark a task as accepted and ready to start.  
✓ Decline: Decline a task with a reason. 
✓ Start: Begin working on an accepted task. 
✓ Complete: Mark a task as completed 
✓ Archive: Move a task to the archive after completion or other criteria. 
3. Task Organization: 
✓ Displays tasks in a list view. 
✓ Separates completed or overdue tasks with visual indicators 
4. Overdue Task Handling: 
✓ Marks overdue tasks automatically with appropriate status and color. 
✓ Updates the database to reflect overdue status. 
5. Navigation and Additional Features: 
✓ Navigate to the Archives Page to view archived tasks.   
✓ Navigate to the Chat Page to communicate with other users.   
✓ Log Out to return to the login page. 
USER INTERFACE 
1. Welcome Message 
✓    Displays a personalized greeting with the worker's username. 
2. Task List 
✓ Active tasks are shown in a list with actionable buttons (e.g., Accept, 
Decline, Start, Complete, Archive). 
✓ If no tasks are available, a "No Tasks" message is displayed. 
3. Navigation Bar  
✓ Buttons for Archives, Chat, Settings, and Logout. 
Task Management Instructions 
Viewing Tasks 
✓ Tasks are automatically loaded when the page initializes.   
✓ Each task displays: 
✓ Name 
✓ Description 
✓ Due Date 
✓ Current Status   
✓ Tasks overdue are marked as "Overdue" in red with a status of `"Overdue” 
TASK ACTIONS 
Accepting a Task 
✓ Locate a task with an Accept button enabled. 
✓ Tap the Accept button.   
✓ The task status updates to allow starting it. 
✓ The database reflects the updated status. 
Declining a Task 
✓ Locate a task with a Decline button enabled. 
✓ Tap the Decline button.   
✓ Enter a reason for declining in the provided prompt. 
✓ Confirm the action.   
✓ The task status updates to "Declined :(". 
✓ The database records the reason and updates the task status. 
Starting a Task 
1. Locate a task with a Start button enabled. 
2. Tap the Start button.   
✓ The task status updates to `"In progress..."` with a yellow
green colour. 
✓ The database reflects the updated progress. 
Completing a Task 
1. Locate a task with a Complete button enabled. 
2. Tap the Complete button.   
✓ The task status updates to `"Completed ^_^"` with a green 
colour. 
✓ The task becomes eligible for archiving. 
Archiving a Task 
1. Locate a completed or declined task with an Archive button enabled. 
2. Tap the Archive button.   
✓ The task is removed from the active list and stored in the 
archive. 
✓ The database is updated to remove the task from active 
assignments. 
ADDITIONAL FEATURES 
Navigating to Archives 
✓ Tap the Archives button to view archived tasks.   
Chat Functionality 
✓ Tap the Chat button to access the chat service and 
communicate with others. 
Logging Out 
✓ Tap the Logout button. 
✓ Confirm the action to return to the login screen. 
Developer Notes 
✓ The Settings feature is under development and will be 
available in a future update. 
✓ Overdue tasks are processed automatically during page 
initialization. 
Visual Indicators 
1. Task Status Colours 
✓ Green: Completed   
✓ Yellow Green: In Progress   
✓ Red: Declined or Overdue   
2. Overdue Task Handling 
✓ Automatically marks tasks due before the current date as 
overdue. 
✓ Updates UI and database to reflect overdue status.
