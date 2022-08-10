# Sports Scores Demo using Dart and MigratoryData w/ or w/o Kafka

This is a web-only app written in Dart. Its multi-platform version written in Dart with Flutter UI &mdash; which can be compiled as a web app, or as an Android or iOS mobile app, or as a desktop app for MacOS, Windows, or Linux &mdash; is available [here](https://github.com/migratorydata/demo-flutter-livescore). Please refer to the blog post [Building realtime web and mobile apps that scale to millions of users with Flutter and Kafka](https://migratorydata.com/blog/migratorydata-with-flutter-and-kafka/) for more context.

## Prerequisites

We assume you have the Dart language installed. Otherwise get it as detailed [here](https://dart.dev/get-dart). 

Install the `webdev` package as follows:

```bash
dart pub global activate webdev
```

## Use the existing MigratoryData deployment

This app is configured to connect to a MigratoryData deployment available at `demo.migratorydata.com`, so you can run it without installing MigratoryData or Kafka.

However, if you wish to run this demo with your MigratoryData deployment or your MigratoryData & Kafka deployment please install MigratoryData or MigratoryData & Kafka as detailed [here](INSTALL.md).

## Get the code and install the dependencies

Download this project by cloning it with the following command or by using any other download method:

```bash
$ git clone https://github.com/migratorydata/demo-dart-sports-scores.git
```

Change to the folder where you downloaded this project and run the following command to get the dependencies:

```bash
$ dart pub get
```

## Running in dev mode

To compile and run the example execute the following command:

```bash
$ webdev serve
```

Open http://localhost:8080 to view this demo in your browser.

## Deployment

When you are ready to build your app for production, run:

```bash
$ webdev build
``` 

The app will be generated into the folder `build`. Copy it to your production web server.
