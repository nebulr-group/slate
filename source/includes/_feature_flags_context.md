You can send whatever context information you want to the evaluation api. But we've simplified it using a base structure so you can build the segment targets in Nblocks Admin more easily.

The context object contains three areas, `user`, `org` and `device`.

Each one of them contains the property `key`. You can assign any value to this property.
You can also assign any values you want to the other properties.
When building the segment targets you can define is the value should be equal (`==`), contain, beginWith or endWith the value.
Structure of the body that can be sent to `/flags/evaluate`