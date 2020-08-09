## COVID 19 VueJS and R Shiny dashboard

Example of a Shiny App with a VueJS front-end<br><br>
This project wants to help overcoming some of the common drawbacks in developing R Shiny Apps.<br>
Shiny Apps can become quite convoluted when they become larger and become hard to maintain. Modern JavaScript Frameworks like React or Vue make use of Components, where templates, scripts and styled are encapsulated and are therefore much easier to maintain and scale. Furthermore the Vue Highcharts Library makes development of charts easy and allows very smooth transitions of the chart if the underlying data changes.<br><br>
On the other hand, R provides awesome packages for data wrangling and reactity in R makes it easy to work with data without creating tons of requests to an API. This App tries to bring together the best of both worlds.

### Installation

```
git clone https://github.com/Data-Mastery/COVID-19-Dashboard.git
cd COVID-19-Dashboard/frontend
npm install
```

### Get Covid 19 data from Johns Hopkins
```
cd .. # Back to root folder.
git clone https://github.com/CSSEGISandData/COVID-19.git
```

### Development
The project makes use the the Vue CLI build process to serve a single `index.html` file with the `HtmlTemplate` function in R. To update the frontend automatically we use the `--watch` parameter.

```
cd frontend
npm run build # creates the dist folder with minified javascript
cd .. # Back to the folder where the app.R file lives
RScript main.R # serves the app.R file, make sure you added R to your local PATH
```

### Access the App

Open: http://localhost:3000/

Have fun :-).

[![ezgif.com-optimize2f656c7ba3b7c53a.gif](https://s7.gifyu.com/images/ezgif.com-optimize2f656c7ba3b7c53a.gif)](https://gifyu.com/image/cpd8)