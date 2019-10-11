import lkml
import os

directory = os.fsencode('views')

for view in os.listdir(directory):
	print('\n')
	print(os.fsdecode(view).split('_core')[0], ' [label=<')
	print('<table border="0" cellborder="1" cellspacing="0">')
	print('  <tr><td><i>'+os.fsdecode(view).split('_core')[0]+'</i></td></tr>')
	with open('views/'+os.fsdecode(view), 'r') as file:
	    parsed = lkml.load(file)

	for dimension in parsed['views'][1]['dimensions']:
	    print('  <tr><td port="'+os.fsdecode(view).split('_core')[0]+dimension['name']+'">'+dimension['name']+'</td></tr>')
	print('</table>>];\n')

with open('block_shopify.model.lkml', 'r') as file:
    parsed = lkml.load(file)
for join in parsed['explores'][1]['joins']:
    tokens = join['sql_on'].replace('$', '').replace('{', '').replace('}', '').split(' = ')
    print(tokens[0].split('.')[0]+':'+tokens[0].replace('.','')+' -> '+tokens[1].split('.')[0]+':'+tokens[1].replace('.',''))



# Foo [label=<
# <table border="0" cellborder="1" cellspacing="0">
#   <tr><td><i>Input Foo</i></td></tr>
#   <tr><td port="1">one</td></tr>
#   <tr><td port="2">two</td></tr>
#   <tr><td port="3">three</td></tr>
#   <tr><td port="4">four</td></tr>
#   <tr><td port="5">five</td></tr>
#   <tr><td port="6">six</td></tr>
# </table>>];

# location:locationid -> customer_address:customer_addresscountry_code;