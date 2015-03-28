angular.module('app').controller('PostsCtrl', function($scope, $location, Restangular) {
  $scope.posts = [];
  loadPosts();

  // GET posts from server. Send app instance to server.
  function loadPosts() {
    Restangular.all('posts').getList().then(function(posts) {
      $scope.posts = posts;
    });
  }
});
