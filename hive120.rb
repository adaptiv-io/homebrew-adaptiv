class Hive120 < Formula
  homepage 'https://hive.apache.org'
  url 'https://www.apache.org/dyn/closer.cgi?path=hive/hive-1.2.0/apache-hive-1.2.0-bin.tar.gz'
  sha256 "38569761590b68e11aab950cffb8af39fd11bc923e65ad7415aa0b080796ef0d"

  depends_on 'hadoop'
  depends_on :java

  def install
    rm_f Dir["bin/ext/*.cmd", "bin/ext/util/*.cmd"]
    libexec.install %w[bin conf examples hcatalog lib scripts]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    Hadoop must be in your path for hive executable to work.
    After installation, set $HIVE_HOME in your profile:
      export HIVE_HOME=#{libexec}

    If you want to use HCatalog with Pig, set $HCAT_HOME in your profile:
      export HCAT_HOME=#{libexec}/hcatalog

    You may need to set JAVA_HOME:
      export JAVA_HOME="$(/usr/libexec/java_home)"
    EOS
  end
end
