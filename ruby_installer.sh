# 1) 移除失效的 PPA 并更新索引
sudo add-apt-repository --remove ppa:brightbox/ruby-ng || true
sudo rm -f /etc/apt/sources.list.d/brightbox-ubuntu-ruby-ng-*
sudo apt update

# 2) 安装 Ruby & 构建依赖
sudo apt install -y ruby-full build-essential zlib1g-dev

# 3) 把 gems 装到用户目录，避免 sudo
echo 'export GEM_HOME="$HOME/.gems"' >> ~/.bashrc
echo 'export PATH="$HOME/.gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 4) 安装 bundler + jekyll（用较新的 bundler 以避开老版本兼容问题）
gem update --system
gem install bundler:2.7.1 jekyll

# 5) 进入你的站点目录（注意路径有空格，要加引号）
cd "/mnt/c/Users/Evan Wu/Desktop/Affairs/Graduate/UMN PhD/evan.github.io"

# 6) 升级 lockfile 里的 bundler 版本并安装依赖
bundle _2.7.1_ update --bundler
bundle _2.7.1_ install

# 7) 本地预览（WSL 读 Windows 磁盘有时需要轮询）
bundle _2.7.1_ exec jekyll serve --livereload --force_polling
