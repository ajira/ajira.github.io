bundle exec middleman build && \
git checkout master && \
cp -r ./build/ . && \
git add -A && \
git commit -m "update site" && \
git push && \
git checkout source
