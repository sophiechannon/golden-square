# {{PROBLEM}} Method Design Recipe

## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

Name of the method

Parameters
Return value
Side effects

```ruby
# EXAMPLE

# `estimate_reading_time` determines time it will take to read text
reading_time = estimate_reading_time(text)

text: a string (e.g. "hello world")
reading_time: "The number of minutes it will take to read the given text rounded up to the nearest minute."

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

#is this correct amount of time

estimate_reading_time("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque fringilla bibendum nunc, nec convallis nisl faucibus non. Aliquam blandit ante ut rhoncus iaculis. Nulla molestie ligula nec elementum pretium. Praesent eget felis ex. Sed auctor congue odio, in dapibus nisi tincidunt eu. Quisque et nulla libero. Morbi eget nisi at.") => "About 1 minute"
estimate_reading_time("") => throws an error "No text was provided"
estimate_reading_time(nil) => throws an error "No text was provided"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/single_method_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/single_method_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/single_method_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/single_method_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/golden-square&prefill_File=resources/single_method_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->