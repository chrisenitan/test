export class User {
  constructor(name) {}

  isLoggedIn() {}
  
  getLastLoggedInAt() {}
  
  logIn() {}
  
  logOut() {}

  getName() {}
  
  setName(name) {}

  canEdit(comment) {}
  
  canDelete(comment) {
    return false;
  }
}

export class Moderator {}

export class Admin {}


export class Comment {
  constructor(author, message, repliedTo) {}

  getMessage() {}
  
  setMessage(message) {}
  
  getCreatedAt() {}
  
  getAuthor() {}
  
  getRepliedTo() {}
  
  toString() {}
}

//test
import {User, Moderator, Admin, Comment} from "./solution";

describe('OOP Tests', function() {
  it('example tests', () => {
    let user = new User("User 1");
    expect(user.getName()).toEqual('User 1');
  });
});


///description
Object Oriented Tests
For this challenge, you are going to build a mock comments section.

Design
We're going to focus on two aspects:

Users
Users come in 3 flavors, normal users, moderators, and admins:
Normal users can create new comments, and edit their own comments. They cannot delete any comments.
Moderators have all the permissions the Users have, and on top of that they are able to delete any comments
Admins have all the permissions the Moderators have, and on top of that they are able to edit or delete any comment.
Users can log in and out, and we track when they last logged in.
The log in is done asynchronously using a Promise.
Comments
Comments are simply a message, a timestamp, and the author.
Comments can also be a reply, so we'll store what the replied comment was.
Comments should be displayed in the following way (toString method):
When the comment is not a reply:
`<message> by <author>`
When the comment is a reply:
`<message> by <author> (replied to <other author>)`
Note: <message>, <author> and <other author> are replaced with the actual values without the wrapping < and >, e.g: hello there from John
Your Challenge
This is challenge is not about building a fully functional application, but more about focusing on the clean design from an object-oriented point-of-view. We've provided the basic structure (which is incomplete), which we would like you to complete.

Additional information
The provided basic structure must be completed as-is.
Additional methods are allowed, but not required.
Do not change the signature of the existing methods and constructors
You can use any online resources you want (Google, Stack Overflow etc)
You can use your own editor to develop the solution in, and paste the code into the online IDE
There is no time limit for this challenge. You can use as much time as you want.
When you submit your solution, a list of unit tests will be executed against your solution and the result will be shown to you. You cannot see the source code for these unit tests.
The code you submit should be exactly as if this was code you were checking in and creating a pull request for, in your day-to-day work. When we review your submission, we will review it as if it was a pull request.

