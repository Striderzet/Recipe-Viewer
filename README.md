### Steps to run the app
Simple running of the app will load the recipe list to the root view. Pull down refresh will update the current list to update the UI with most recent requested data and cached images are loaded if the URL exists already.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
Async await networking layer with generic object setting for parsing and flexibility, MVVM architecture, SwiftUI functionality for ease of readability, unit testing with some abstraction. I feel these areas are key because they are essential for not only the app to run smoothy, but for other developers to come in and be able to hit the ground running to add features and maintain the app. I practice these things no matter the size of the app.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
About 4.5 hours

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
Instead of using a external framework for image caching, I created a custom cache that utilized SwiftUI's AsyncImage. This saved on significant built time and gave more to customization of caching in the app, and could be used as a template to use for other objects.

### Weakest Part of the Project: What do you think is the weakest part of your project?
I had to implement a method that delayed an error message alert from being shown after malformed data is fetched. It needed to be done done so the pulldown animation does not get stuck. This did not break the app, but did not look clean for the UI, so it had to be fixed this was for now.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?
I did not use any external dependancies for this project.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
This is an awesome take home interview project and it is refreshing to see. I feel I was able to exhibit a lot of my SwiftUI knowledge here






