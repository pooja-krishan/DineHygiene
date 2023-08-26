# Restaurant Hygiene Rating Web Application

## Problem Statement

The goal of this project is to develop a web-based application that facilitates the rating of restaurants' hygiene parameters by users who have visited those restaurants. Additionally, the application aims to provide a platform for users to view hygiene ratings for restaurants on both the website and maps. The primary audience for this application includes avid restaurant-goers.

## Literature Survey

The inspiration for this project comes from the FSSAI Food Hygiene Rating Scheme, which was launched in September 2019. This scheme promotes transparent scoring and rating processes for restaurants' hygiene practices. Similar schemes exist in various countries worldwide, such as the "Food Hygiene Rating Scheme" in the UK and "Scores on Doors" in Australia. The proposed rating system will consist of two parts:

- **Hygiene Ratings:** This section will score and rate Food Business Operators (FBOs) based on their adherence to basic hygiene requirements. These requirements encompass various aspects, including the handling of raw materials, premises cleanliness, and food storage.

- **Hygiene Ratings +:** Also known as the "Responsible Place to Eat," this aspect will extend the FBO's responsibilities to provide safe and nutritious food to a wider community. This involves caring for employees, serving the underprivileged, and promoting healthy choices.

The application will emulate the Zomato Hygiene Ratings initiative, partnering with third-party auditors for the assessment. These audits will evaluate FBOs' adherence to food hygiene standards, such as food handling practices, separate cooking spaces, and overall cleanliness.

## Problems with Existing Systems

The current restaurant hygiene rating systems encounter several challenges:

1. **Lack of User Input Validation:** The absence of a mechanism to validate user inputs can lead to mistakes and inaccurate scores.

2. **Human Errors:** Human errors can lead to incorrect ratings being submitted.

3. **Outdated Information:** Over time, the information may become outdated, affecting the accuracy of hygiene ratings.

## Proposed Solutions

To address these challenges, the following solutions are proposed:

1. **QR Code Validation:** Introduce a QR code on restaurant bills that users can scan to access the restaurant for rating. This ensures that only those who have visited the restaurant can provide ratings.

2. **Structured Questions:** Design a set of well-defined questions aligned with FSSAI parameters. Users will rate each question on a scale of 1 (least) to 5 (highest).

3. **Timestamp and Data Expiry:** Incorporate timestamp information when storing ratings and set a fixed period for data retention. This ensures that outdated ratings are removed.

## Advantages of Proposed System

The proposed system offers several advantages:

1. **Focused Inspections:** Identify the least hygienic restaurants based on user ratings, allowing food safety auditors to conduct physical inspections and implement corrective measures.

2. **Informed Decision-Making:** Restaurant-goers can make informed choices when trying new restaurants by utilizing displayed hygiene ratings.

## Tools and Technologies Used

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** MySQL, JSP, PHP
- **Application Server:** GlassFish Server 4.1.1
- **Database:** MySQL

## System Architecture Diagram
![System Architecture](https://github.com/pooja-krishan/DineHygiene/blob/main/system-architecture.PNG)

## UML Diagrams - Use Case
![Use Case](https://github.com/pooja-krishan/DineHygiene/blob/main/use-case.PNG)
