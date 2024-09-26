setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export TESTDIR=~/tmp/test-ddev-localhostrun
  mkdir -p $TESTDIR
  export PROJNAME=test-ddev-localhostrun
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true
  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
  ddev start -y >/dev/null
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get ${DIR}
  ddev restart
  # ddev localhostrun | grep -e '*.lhr.life'  
  ddev localhostrun -- --output json | grep -e '*.lhr.life'
  # find out how can the public url read from terminal output.
}

@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev get bhanu951/ddev-localhostrun with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev get bhanu951/ddev-localhostrun
  ddev restart >/dev/null
  ddev localhostrun | grep -e '*.lhr.life'
  # find out how can the public url read from terminal output.
}
