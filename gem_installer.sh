# 1) 让 gem 安装到用户目录（非系统目录）
echo 'export GEM_HOME="$HOME/.gems"' >> ~/.bashrc
echo 'export PATH="$HOME/.gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 验证应指向你的家目录
echo "GEM_HOME=$GEM_HOME"
gem env home

# 2) 安装 Bundler 2.7.1（不要 sudo）
gem install bundler -v 2.7.1 --no-document

# 验证 bundler 版本（会显示 2.7.1）
bundle _2.7.1_ --version
