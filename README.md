### Steps to run the app
Simple running of the app will load the recipe list to the root view. Pull down refresh will update the current list to update the UI with most recent requested data and cached images are loaded if the URL exists already.

### Focus Areas:
Async await networking layer with generic object setting for parsing and flexibility, MVVM architecture, SwiftUI functionality for ease of readability, unit testing with some abstraction. I feel these areas are key because they are essential for not only the app to run smoothy, but for other developers to come in and be able to hit the ground running to add features and maintain the app. I practice these things no matter the size of the app.

### Trade-offs and Decisions:
Instead of using a external framework for image caching, I created a custom cache that utilized SwiftUI's AsyncImage. This saved on significant built time and gave more to customization of caching in the app, and could be used as a template to use for other objects.

### Weakest Part of the Project:
I had to implement a method that delayed an error message alert from being shown after malformed data is fetched. It needed to be done done so the pulldown animation does not get stuck. This did not break the app, but did not look clean for the UI, so it had to be fixed this way for now.

### External Code and Dependencies:
I used some code snippets that I have had from previous personal projects. I did not use any external dependancies for this project.

### Additional Information: 
I was able to exhibit a lot of my SwiftUI knowledge here






