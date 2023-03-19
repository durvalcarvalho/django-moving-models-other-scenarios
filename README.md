### Scenarios

#### 1. Moving tables with elements (e.g. indexes) not defined by the model

This scenario explores the implications of moving a model from one Django app to another, where the model's associated database elements (such as indexes) were not defined by the model itself. This can potentially cause issues in the new app, where the necessary indexes may not be present, leading to performance or data consistency problems.

#### 2. Moving tables with database elements normally outside the realm of Django's control (triggers)

Moving a model between apps can also have implications for database elements that are outside the scope of Django's standard ORM, such as triggers. In this scenario, we test how moving a model with associated triggers between apps can impact database integrity and functionality.

#### 3. Moving tables with database elements normally outside the realm of Django's control (views)

Finally, this scenario tests the implications of moving a model between apps when it has associated database views, which are not typically managed by Django's ORM. We explore the potential issues that can arise when moving a model with views, such as changes to the underlying data, performance impacts, and other concerns.
