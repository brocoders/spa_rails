'use strict';

/**
* Config for the restangular
*/
angular.module('app')
  .config(function(RestangularProvider) {
    RestangularProvider.setBaseUrl('/api');


    RestangularProvider.addResponseInterceptor(function (response, operation, what) {
      if (operation === 'getList') {
        if (response['resources']) response['resources'].count = response.count;
        return response['resources'];
      }
      if (['get', 'post', 'put'].indexOf(operation) !== -1) {
        return response['resource'];
      }
      return response;
    });

    RestangularProvider.addRequestInterceptor(function (request, operation, what) {
      if (operation === 'post' || operation === 'put') {
        return {resource: request};
      }
      return request;
    });

    RestangularProvider.setDefaultHeaders({'Content-Type': 'application/json'});
  });
