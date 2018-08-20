# hiss
A Tornado test application. WIP 

Includes:

* Python 3.6
* Tornado
* Webpack
* TailwindCSS
* SASS
* Stimulus
* Postgres

To run: 

1. clone the repository
2. run `docker-compose up --build` from within the directory. 
3. from a new terminal run `docker exec -ti hiss_web_1 bash` to open a bash session in the running container
4. run `yarn run watch` from this container
5. navigate to `0.0.0.0:8888/about` to see an incredibly simple test.
