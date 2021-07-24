# gigqo_assignment

That's standard new Flutter project containing Flutter Counter Demo application.

## Goals of assingment

You need to clone the repo and create your own branch where you will modify the app.

In your branch you need to handle mock-up data from Gigqo beta-api backend server.

API main endpoint URL: https://beta-api.gigqo.com/api

API contains basic REST endpoints implementing CRUD operations:

| Metod | Route | Desciption
|---|---|---|
| GET    | /mockup/tracks      | List all tracks 
| GET    | /mockup/tracks/{id} | Get details for specific track
| POST   | /mockup/tracks      | Create track
| PUT    | /mockup/tracks      | Update track
| DELETE | /mockup/tracks      | Delete Track

For the moment json response for all endpoints have folowing common structure:

```
{
    "status": "",   // "success" or "error"
    "message": "",  // error specific message or null in case of success
    "data": {}      // payload of the request or null in case if error
}
```

For track list `data` contains array of track object which in turn used in other API endpoints:

```
{
  "id" : {
      "Name": "",   // Name of the track
      "Artist": "", // Artist
      "Year": "",   // Year :-)
      "cover": ""   // Cover image URL
    }
}
```

Mockup responses contains static data, but may return errors randomly!

For fetching and storing data you can use simple Flutter approach,
but if you are familiar with more advanced application state management approaches, like Providers, BloC, GetX etc. it is a plus to implement or use existing solutions in app architechture.

Finally your version of App should have UI to represent fetched data with at least one extra screen for detailed information
about track.



## Flutter Getting Started documentation

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
