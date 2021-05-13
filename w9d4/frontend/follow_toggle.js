
class FollowToggle {
    constructor($el) {
        this.userId = $el.data('user-id')
        this.followState = $el.data('initial-follow-state')
        this.render();
        this.handleClick();
    }

    render() {
      if (this.followState === 'unfollowed') {
        return $(button).text('Follow!');
      } 
      if (this.followState === 'followed!') {
        return $(button).text('Unfollow!');
      } 
    }

    handleClick() {

    }

}

module.exports = FollowToggle;
