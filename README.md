<h1 align="center">MovieZone</h1>
<h4 align="center">
	A Movies guide app with various details and trailers.Discover the most popular and top trending movies playing. Movies data fetched using <a href="https://www.themoviedb.org/">themoviedb.org</a> API.
</h4>

  


## ✨ Screenshots

<img src="https://user-images.githubusercontent.com/49573131/142771233-52e5fe5d-86a5-4997-bbee-785e667060d7.jpg" width="320" height="600">          <img src="https://user-images.githubusercontent.com/49573131/142771983-a1e618d6-bb49-4c2d-830c-814cd39b7dd1.png" width="320" height="600">          <img src="https://user-images.githubusercontent.com/49573131/142771987-d4e97a12-6915-43d5-b127-34c09577295e.png" width="320" height="600">          <img src="https://user-images.githubusercontent.com/49573131/142772051-3674a96c-bd47-4795-9439-d1c9e86681e7.png" width="320" height="600">          <img src="https://user-images.githubusercontent.com/49573131/142772091-312df8f1-4f8a-44b0-a15d-0a35837757c0.png" width="320" height="600">

## 🌟 Features
*   Discover the most popular and the most Trending movies
*   User can view and play trailers on video dialogue
*   Shows a list of reviews for each movie
*   Users can mark a movie as favorite in the details view by tapping a plus icon 


### App Architecture 
Based on Clean architecture and repository pattern.

#### The app includes the following main components:

* A local database that servers as a single source of truth for data presented to the user. 
* A web api service.
* A repository that works with the database and the api service, providing a unified data interface.
* A Bloc that provides data specific for the UI.
* The UI, which shows a visual representation of the data in the Bloc.


## Authors

* **Tridev Deka** - *LinkedIn* - [Tridev Deka](https://www.linkedin.com/in/tridev-deka/)

```
MIT License

Copyright (c) 2023 Tridev Deka
```

