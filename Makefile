all: hugo rsync chmod

hugo:
	hugo

cp: 
	scp -r uva rivanna:www/infomall

rsync: 
	rsync -rv uva rivanna:www/infomall

chmod:
	ssh rivanna "cd www/infomall/uva; sh ../../permissions.sh"
