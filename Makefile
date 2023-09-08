all: hugo rsync chmod

.PHONY: pubs

# local:
# 	mkdir -p uva
# 	docker-compose up

# run shell:
# 	@if docker ps -q -f name=infomall-org-uva-site-1 | grep -q . ; then \
# 		echo "Container is already running. Attaching..." ; \
# 		docker exec -it infomall-org-uva-site-1 bash ; \
# 	else \
# 		echo "Container is not running. Starting new container..." ; \
# 		docker run -it --privileged --detach --name infomall-org-uva-site-1 --cap-add=NET_ADMIN \
# 		-v $(PWD):/app -v ~/remote_mount:/app/remote_mount $(DOCKER_IMAGE_NAME) ; \
# 	fi


hugo:
	hugo

clean:
	rm -rf uva

cp: hugo
	scp -r uva rivanna:www/infomall
	make -f Makefile chmod

publish:
	# cms vpn connect
	make -f Makefile rsync


rsync: hugo
	rsync -rv uva rivanna:www/infomall
	make -f Makefile chmod

windows: hugo
	wsl -e bash -c "rsync -rv uva rivanna:/project/bii_dsc/www/infomall"
	wsl -e bash -c "make -f Makefile chmod"

chmod:
	ssh rivanna "cd www/infomall/uva; sh ../../permissions.sh"

pubs:
	# open https://docs.google.com/document/d/1M61ieHlwHs96ZL3fZCtQ_zAbgH69vnPWn2S6C1eCGqY/edit?usp=sharing
	# open https://docs.google.com/document/d/1KaJTAwEOI7fnJof24V5awyLpKhxTp7xDRoidBsOPG3M/edit?usp=sharing

	# https://docs.google.com/document/d/1wStlbgWLbfOJsCHHZgU75dbK7urfh_CakNN-7_GAd70/edit
	# gdown 1M61ieHlwHs96ZL3fZCtQ_zAbgH69vnPWn2S6C1eCGqY
	# gdown 1KaJTAwEOI7fnJof24V5awyLpKhxTp7xDRoidBsOPG3M

	# put the html zip files in folder pubs
	cd pubs; unzip -o "Publications Page.zip"
	cd pubs; unzip -o "Presentations Page.zip"
	cd pubs; mv PresentationsPage.html presentations.html
	cd pubs; mv PublicationsPage.html publications.html

	#cp pubs/*.html content/en/docs/references
	#cp pubs/*.html content/en/docs/references
	cd pubs; chmod a+x *.html
	scp pubs/publications.html rivanna:www/infomall/pubs/index.html
	scp pubs/presentations.html rivanna:www/infomall/presentations/index.html
	scp pubs/memories.html rivanna:www/infomall/memories/index.html
	# ssh rivanna "cd www/infomall/pubs; sh ../../permissions.sh"

serve:
	hugo serve

view:
	open http://localhost:1313/uva/
