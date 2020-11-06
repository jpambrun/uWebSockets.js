default:
	$(CC) build.c
	./a.out || build.exe

build:
	git submodule update --init --recursive
	docker build --progress plain . -t uws
	git clone --depth 1 git@github.com:jpambrun/uWebSockets.js.git --branch binaries --single-branch /tmp/uws_binaries
	id=$$(docker create uws) && docker cp $$id:/workdir/dist /tmp/uws_dist && docker rm -v $$id
	cp /tmp/uws_dist/*.node /tmp/uws_binaries/
	cd /tmp/uws_binaries/
	git commit . -m 'update bins'
	git push
