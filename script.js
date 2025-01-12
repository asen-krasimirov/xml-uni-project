function filterMuseums() {
    var region = document.getElementById('regionFilter').value;
    var type = document.getElementById('typeFilter').value;
    var rows = document.getElementsByClassName('museumRow');

    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        var rowRegion = row.getAttribute('data-region');
        var rowType = row.getAttribute('data-type');

        if ((region === 'all' || rowRegion === region) && (type === 'all' || rowType === type)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    }
}