# multi_json + jbuilder error

With multi_json 1.6.0, Jbuilder chokes when generating JSON on associations where no specific fields are identified. See the `app/models/user.rb` file for examples.

1. `rake db:migrate && rake db:seed`
2. `rails console`
3. Try `User.json`. It works.
4. Try `User.json_with_post_names`. It works.
5. Try `User.json_with_full_posts`. It chokes.

Specifying specific fields to include seems to work fine (e.g. `json.posts user.posts, :name`); the error only happens when not specifying fields (i.e. requesting the complete `Post` object).
