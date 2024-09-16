# Chat Application

## Overview

This is a chat application built with Ruby on Rails, MariaDB, Redis, and Sidekiq. The application allows users to create applications, manage chats, and send messages. It also includes features for searching through chat messages using Elasticsearch and handling concurrent requests with Sidekiq.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Running the Application](#running-the-application)


## Features

- **Application Management:** Create and manage applications with unique tokens.
- **Chat Management:** Create chats within applications and manage messages.
- **Search Functionality:** Search through messages using Elasticsearch. (Not implemented)
- **Background Jobs:** Handle concurrent requests and background processing using Sidekiq.
- **Dockerized Environment:** Easily deploy the application using Docker Compose.

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Bundler](https://bundler.io/) for running Ruby applications.
- Basic understanding of Ruby on Rails, MariaDB, Redis, and Sidekiq.
- Verions:
    * Ruby : 3.1.5
    * Rails : 7.2.1
    * MySQL : Ver 15.1 Distrib 10.6.16-MariaDB
    * Sidekiq : 7.3.2
    * Redis : 7.0.15

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ragiaharafat/chat_apps.git
   cd chat_apps
2. **Start the application:**
    ```
    docker-compose up
3. **APIs:**
    * Application :
        - Create the application:
            ```
            POST  https://localhost:3000/apps/
            json
                {
                    {
                        name: "App Name"
                    }
                }
            ```
            
        - Get all the applications: 
            ```
            GET https://localhost:3000/apps/
            ```
        - Get a specific application:
            ```
            GET https://localhost:3000/apps/{token}
            ```
        
    * Chats:
        - Create a new chats:
            ```
            POST https://localhost:3000/apps/{token}/chats/

            json
                {
                    {
                        number: chat_number
                    }
                }
            ```
        
        - Get all chats in a certain app:
            ```
            GET https://localhost:3000/apps/{token}/chats
            ```
        
        - Get a specific chat in a certain app:
            ```
            GET https://localhost:3000/apps/{token}/chats/{id}
            ```
        
        - Delete a certain app 
            ```
            DELETE https://localhost:3000/apps/{token}/chats/{id}
            ```

    * Messages:
        - Send a message in a chat:
            ```
            POST https://localhost:3000/apps/{token}/chats/{id}/messages/

            json
                {
                    {
                        body: "Text"
                    }
                }
            ```

        - Get the messages in a chat:
            ```
            GET https://localhost:3000/apps/{token}/chats/{id}/messages/
            ```

        - Get a certain message in a chat
            ```
            GET https://localhost:3000/apps/{token}/chats/{id}/messages/{id}
            ```
        
        - Delete messages
            ```
            DELETE https://localhost:3000/apps/{token}/chats/{id}/messages/
            ```


    