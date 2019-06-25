# Instalação gitlab runner em instância amazon linux 1

DOCKER_IMAGE=$1
REGISTRATION_TOKEN=$2
RUNNER_DESCRIPTION=$3
RUNNER_TAG=$4

sudo wget -O /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo yum install -y docker
useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

sudo gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --registration-token "${REGISTRATION_TOKEN}" \
  --executor "docker" \
  --docker-image alpine:3:8 \
  --description "${RUNNER_DESCRIPTION}" \
  --tag-list "${RUNNER_TAG}" \

sudo usermod -aG docker gitlab-runner
