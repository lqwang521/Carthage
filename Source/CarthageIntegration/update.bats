#!/usr/bin/env bats

setup() {
    cd $BATS_TMPDIR
    rm -rf ReactiveObjC
    git clone -b 1.0.1 https://github.com/ReactiveCocoa/ReactiveObjC.git
    cd ReactiveObjC
}

teardown() {
    cd $BATS_TEST_DIRNAME
}

@test "carthage update builds everything" {
    run carthage update --platform mac --no-use-binaries
    [ "$status" -eq 0 ]
    [ -e Carthage/Build/Mac/Quick.framework ]
    [ -e Carthage/Build/Mac/Nimble.framework ]
}
