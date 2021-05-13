
class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userId = this.$el.data('user-id')
        this.followState = this.$el.data('initial-follow-state')
        // this.button = $(button)
        this.render();
        this.$el.click(this.handleClick.bind(this));

        //distinct diff between $el and $(el)
        // $el: variable name to show jQuery object
        // $(el): is the actual conversion from HTML --> jQuery object
    }

    render() {
      if (this.followState === 'unfollowed') {
        this.$el.text('Follow!');
      } 
      else {
        this.$el.text('Unfollow!');
      } 
    }

    handleClick(event) {
      event.preventDefault();

      if (this.followState === 'unfollowed') {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          dataType: 'json',
          type: 'POST',
          // async: false
        })
        this.followState = 'followed!'
        this.render();
      } else {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          dataType: "json",
          type: "DELETE",
          // async: false
        });
        this.followState = "unfollowed";
        this.render();
      }
    }

}

module.exports = FollowToggle;
