bundle exec middleman build && \
git checkout master && \
cp -r ./build/ . && \
git add -A && \
gcmsg "update site" && \
git push && \
git checkout source
