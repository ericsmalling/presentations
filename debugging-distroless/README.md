# How the heck do I debug distroless containers?
A presentation by Eric Smalling.

Presented to:
* [DevOpsDays Dallas-Fort Worth 7](https://devopsdays.org/events/2024-dallas/program/eric-smalling/)
  * Plano, TX, USA
  * October 9, 2024

* [Kubernetes and Cloud Native North Dallas](https://www.meetup.com/kubernetes-and-cloud-native-north-dallas/events/300443775)
  * Plano, TX, USA
  * October 17, 2024

* [Cloud Native Rejekts NA`24](https://cfp.cloud-native.rejekts.io/cloud-native-rejekts-na-salt-lake-city-2024/talk/UZJWHM/)
  * Salt Lake City, UT, USA
  * November 10, 2024
 
## Content
* [Slides](How%20the%20heck%20do%20I%20debug%20distroless%20containers.pdf)
* _Recording (pending)_

## Tools used/mentioned:
* [Google Distroless Images](https://github.com/GoogleContainerTools/distroless)
* [Docker Debug](https://docs.docker.com/reference/cli/docker/debug/)
* [cdebug](https://github.com/iximiuz/cdebug)
* [dive](https://github.com/wagoodman/dive)
* [grype](https://github.com/anchore/grype)


## Related Content:
* [Images as Code: The pursuit of declarative image builds](https://www.chainguard.dev/unchained/images-as-code-the-pursuit-of-declarative-image-builds)
* [Software Engineering Daily: Container Security with Matt Moore](https://softwareengineeringdaily.com/2024/09/26/container-security-with-matt-moore/)
* [Debugging Distroless Containers with Docker Debug](https://youtu.be/ELxIBB2Uy2E?si=Q8tWujeWFa2hLXhq)
* [Debugging Distroless Images with Kubectl Debug and CDebug](https://youtu.be/LQUZGE_w-20?si=7o7D6Q5_IF7KY0TV)


## Running the demonstrations
### Prerequisits
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or other container runtime)
* [kind](https://kind.sigs.k8s.io/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* [cdebug](https://github.com/iximiuz/cdebug)
* [Pipe Viewer (pv)](https://www.ivarch.com/programs/pv.shtml) (required for the demo script runner)

### Runtime demo
Prep the environment by starting the kind cluster and/or clearing out prior deployments:
``` shell
cd runtime
./setup.sh
```
Run the demo:
``` shell
./demo.sh
```
Cleanup when finished (shuts down kind and removes the `prometheous` container)
```shell
./teardown.sh
```
### Build demo
_TODO_


