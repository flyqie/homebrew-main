# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  version "23.23.23"
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/flyqie/idb/README.md"
  url "https://github.com/flyqie/idb/releases/download/v23.23.23/idb-companion.universal.tar.gz"
  sha256 "0b4e8b57a4e98eeaeacfb33a884e42236210840b5d36fc7d05fbe776986608c2"
  head "https://github.com/flyqie/idb.git", branch: "main"

  depends_on :xcode => ["13.0", :build]

  def install
    bin.install "bin/idb_companion"
    frameworks.install Dir["Frameworks/*"]
  end

  def post_install
    Dir
      .glob("#{prefix}/Frameworks/**/*.dsym")
      .each do |shim|
        system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end

end