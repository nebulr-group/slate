Instead of providing the user's access token you can send your own user context information to the evaluation api. 

We recommend you to send as much information as possible from start for a flexible experience without the need for re-releases while you add more flags and conditions. 

We've simplified this by defining a base structure of what information to send so you can more easily build your groups and conditions in Nblocks Admin.

The [context object](#feature-flags-evaluation-context) contains three areas, `user`, `org` and `device`. Each one of them reflect different traits and holds predefined relevant properties that you can assign. Additionally, there's a forth property `custom` which developers can send any key-values they like.

* All areas also contain a property `key` which you can use to provide custom information if none of the others fits your need.
* All these properties can easily be referenced when building the group targets you can define if the value should be `equal` (==), `contain`, `beginsWith`, `endsWith`, `lessThan` or `greaterThan` the value.


This context object can be that can be sent to [/flags/evaluate](#evaluate-a-flag) and [/flags/bulkEvaluate](#evaluate-flags-in-bulk).

<aside class="success">
Providing the access token will automatically resolve all values for user and tenant so you don't have to.
</aside>