# Data Analystics Basics

## Data Analysis Process
- To simplify your decisions, apply these six steps in your data analysis process: 
    1. Identify the problem - The key objectives that the study is trying to uncover
    2. Identify the data sets - Identify key variables by understanding the nature of the business and the targeted problem statement
    3. Gather the data - It may come from multiple sources of different data types
    4. Clean and Format data - By input missing variables, omit outliner, create new broad categories, remove duplicates
    5. Explore and Visualise data - In the form of charts, scatter plot, histogram, heat map, and etc
    6. Socialise Insights - Engage stakeholder by presenting findings and conclusions

## Data Analytics Techniques
- There are two common types of techniques: 
    + Predictive and 
    + Descriptive

### Predictive Techniques
+ Focused on predicting and understanding what could happen in the future based on the current data from a given training dataset.
+ Analysing past data patterns and trends by looking at historical data and customer insights can predict what might happen going forward and, in doing so, inform many aspects of a business, including setting realistic goals, effective planning, managing performance expectations and avoiding risks. Example, forecast future cash flow, churn rate, etc.
- Examples
    + Classification
    + Regression
    + Anomaly Detection

### Descriptive Techniques
+ Descriptive technique find human-interpretable patterns that describe the data.
- Examples
    + [Clustering](#clustering)
    + [Association Rule Discovery](#association-rule-discovery)
    + [Sequential Pattern Discovery](#sequential-pattern-discovery)
    + [Fraud/Anomaly Detection](#fraud-anomaly-detection)
    - Online Retailer
        - Buying trends or patterns among shoppers
            + Up-sell or cross-sell products based on current purchases
    - Instagram
        - To better understand user attitudes by determining 
            + the average number of replies per post, 
            + the number of page views and 
            + the average response time from the number of followers, likes and posts.

### Supervised and Unsupervised Methods
- Data Scientists and Analysts will use both Supervised and Unsupervised methods to solve a problem.

#### Supervised Methods
- Making a decision/learning based on a given training dataset, and applying the knowledge to the test data to produce a new result.
    + This new result will then be used in the new training to produce another new result, rinse and repeat.

#### Unsupervised Methods
- Making a decision/learning without any prior training dataset, thus, no response variable.
    + This is important when you are training on a raw, brand-new data

### Classification
- Classification is about learning how to make predictions from past examples.

#### Examples
- Categorising news stories (i.e. finance, weather, entertainment, sports)
    + Can be applied to Media companies where news will be automatically grouped under a certain category/tag based on its contents.

- Predicting cancer cells
    + Based on historical data of cancer patients and the measurements from some lab test, doctors would like to be able to predict whether the particular patient will developed cancer.

#### Fraud/Anomaly Detection
- Introduction
    - Is a common application of descriptive analytics in the Banking industry.
        + The goal is to predict fraudulent cases in Credit Card Transactions.
        - Examples
            + Based on past credit card transactions, you can predict whether current credit card transaction is fraudulent or not

#### Churn Prediction
##### Churn
- Introduction
    + Churn is a common term or word used in the telecommunication industry. 
    - Telecommunication industry is very competitive; consumers are largely drawn by low pricing and good signal coverage. 
        + Organizations spend huge amounts of money to acquire customers. 
        + Even before a customer is acquired, you must gain brand and product awareness and customer consideration. 
        + This requires lots of effort throughout the sales funnel, using lots of marketing and sales resources. 
        + Once a customer is acquired, they should be held on to dearly (at least the ones with high lifetime value). 
        + Knowing which customers have a high propensity to churn is critical to targeted retention efforts.
        + The goal is to predict whether a customer is likely to be “lost” to a competitor.
    - How do we approach this?
        1. Use detailed record of transactions with each of the past and present customers, to find attributes.
        2. Where he calls, when he calls most, financial status, marital status
        3. Label customers as loyal or disloyal (class label)
        4. Derive a model for loyalty

#### Classification vs Regression
+ In order to understand Regression, we compare with Classification. Regression predicts a value of a given continuous-valued variable based on the values of other variables

- Differences
    + Regression gives a continuous class label
    + Classification gives a categorical class label

- Mission
    - Given a set of examples of attribute values and class labels and 
        + the goal is to learn a rule that computes the label from the attribute values.

- Examples
    - we might be given a set of adults and we'd like to predict whether they're homeless or not. 
        + Suppose the attributes were highest educational level achieved and origin.
        - Comparison
            - Regression
                + The system attempts to predict a value for an input based on past data.
            - Classification
                + Predictions are made by classifying them into different categories.

- Notes
    - Other examples of continuous value include 
        + a person’s weight, 
        + height, 
        + account balance, 
        + etc
    - Other examples of classification include 
        + Yes or No 
        + True of False 
        + Category.

### Clustering
+ Clustering finds groups of objects such that the objects in a group will be similar and different from the objects in other groups
- Cluster Distances
    + Intra-cluster distances are minimized (reduced)
    + Inter-cluster distances are maximized (increased)

#### Applications
- Introduction
    + The primary goal for most organisations is to enhance customer experience, other goals include cost reduction, better-targeted marketing, and making existing processes more efficient.

- Examples
    + Custom profiling for targeted marketing
    + Group related documents for browsing
    + Group stocks with similar price fluctuations
    - Reduce data dimensionality
        - Examples
            + Turning [X,Y,Z] => [ [X,Y], [Y,Z] ]

- Terminologies
    - Often the terms Dimensions, Features and Attributes are used interchangeably. 
        + They meant the same meaning. 
    + Each dimension/ feature/ attribute will contain values. 
    - The advantage of clustering is to reduce complexity, dimensionality 
        + by grouping objects with similar values or characteristics together.

#### Market Segmentation
- Introduction
    - The goal is to subdivide a market into distinct subsets of customers for targeted marketing.
        + This is an example how clustering is applied to divide a group of customers into smaller groups for targeted marketing based on a set of different attributes collected from customers.

- How do we approach this?
    1. Collect different attributes of customers based on their geographical and lifestyle
    2. Find clusters of similar customers.
    3. Measure the clustering quality by observing buying patterns of customers in same cluster vs. those from different clusters.

### Association Rule Discovery
- Association Rule Discovery finds dependency rules that basically links items together with a related feature
    + This shows the likelihood of an item based on the occurrences of others.

- Examples
    - Given the following dataset
        1. Bread Coke Milk
        2. Beer, Bread
        3. Beer, Coke, Diaper, Milk
        4. Beer, Bread, Diaper, Milk
        5. Coke, Diaper, Milk
     - Rules Discovered
        + [Milk] => [Coke]
        + [Diaper, Milk] => [Beer]
     - Explanation
        + The example above shoes how association can be applied to items that can be bought in the supermarket. 
        + The association is trying to find the probability of buying item A together with item B or item C. 
        + If the probability or confident level is high, the supermarket can consider running promotion, e.g. sell 2 or 3 items as a bundle.
        + From the rules, we discovered the likelihood of transaction of Milk product is followed by Coke. Based on this discovery, we can consider running a promotion such as a sale

#### Analysis Applications
- Market-basket analysis
    + Sales promotion, shelf management, and inventory management to analyse consumer buying pattern or behaviour

- Telecommunication Alarm Diagnosis
    + Combination of alarms that occur together frequently in the same time period more for backend diagnosis and troubleshooting of telecommunication systems

- Medical Informatics
    + Combination of patient symptoms and test results associated with certain diseases to predict cancer recurrence rate, etc.

### Sequential Pattern Discovery
- Finds the sequence of occurence of certain objects (find regularities)
    - Usage
        + Such patterns are useful for recommendations

- Sequential pattern is a specialised field of association. 
    - Instead of recommending consumers to buy item B after the purchase of item A, 
        + sequential pattern will try to find the “order” of purchases.
    - Another example is, 
        - after you have bought a car, 
            + you might need to purchase sunshades, car shampoo, engine oil, etc.

## Challenges
### Scalability
+ The first challenge is Scalability - the need to handle massive data. Some of the questions to think about are
    1. Can employ special search strategies for efficient data access? (Google keyword search, boolean search, etc.)
    2. Can also be improved by using sampling?

### High Dimensionality
- The second challenge is the high number of attributes (also called high dimensionality) in a particular data set which makes it difficult to analyse.
    + The dimensionality of a data set is the number of attributes that the objects in the data set have.
    + When this problem is faced, it is referred to as Curse of Dimensionality.

### Complex Data
- The third challenge is the complex data whereby data can be unstructured.
    + Unstructured data is data that has not been structured in a predefined manner. 
    - Unstructured data is typically textual, like 
        + open-ended survey responses and social media conversations, 
    - but can also be non-textual, like 
        + images, 
        + video, 
        + and audio. See an example in the green table.

### Data Ownership
- The fourth challenge is Data ownership and distribution. Data can be stored in multiple locations.
    + Consolidate results (data) obtained from multiple sources
    + Data security and privacy issues
- Legality
    + The Personal Data Protection Act (“PDPA”) will come into action. Questions like data privacy and security will spring into action.
    - Other acts from various nations and organizations include
        + GDPR : European Union
        + CCPA : California Consumer Privacy Act

