var app = angular.module('todoApp', []);
app
  .service('notificationSrvc', function(){
    var notification = this;
    notification.notify = function(msg){
      alert(msg);
    };
  })
  .directive('todoList', function(){
    return {
      restrict: 'E',
      scope: {},
      templateUrl: '/templates/todo-list.html',
      controller: ['$scope', 'notificationSrvc', function($scope, notificationSrvc){
        var todoCtrl = this;
        /* status: done | pending | archived */
        $scope.todos = [
          {text: 'Learn to code in Angular JS 1.6.6', status:'done'},
          {text: 'Learn more about the framework', status:'pending'},
          {text: 'Extend something awesome', status:'pending'},
          {text: 'Build some great stuff ', status:'pending'}
        ];

        $scope.getStatusValue = function(status){
          return status === 'done';
        };
        $scope.remaining = function(){
          return '?';
        };
        $scope.addTodo = function(){
          if($scope.todoText && $scope.todoText.length){
            $scope.todos.push({text: $scope.todoText, status: 'pending'})
            console.log('added todo!',  $scope.todoText);
          }
        };

        $scope.archive = function(){
          notificationSrvc.notify('archived todo');
          angular.forEach($scope.todos, function(item, index){
            if(item.status === 'done'){
              item.status = 'archived';
              console.log(item)
            }
          });
        };

        $scope.isActive= function(item){
          console.log(item)
          return item.status !== 'archived';
        };
      }]
    };
  });


