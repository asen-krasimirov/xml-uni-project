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

function sortMuseums() {
    var table = document.getElementById('museumTable');
    var rows = Array.from(document.getElementsByClassName('museumRow'));
    var sortButton = document.getElementById('sortName');
    var sortDirection = sortButton.getAttribute('data-sort');

    rows.sort(function(a, b) {
        var nameA = a.getElementsByTagName('td')[0].innerText.toLowerCase();
        var nameB = b.getElementsByTagName('td')[0].innerText.toLowerCase();
        
        if (sortDirection === 'asc') {
            return nameA.localeCompare(nameB);
        } else {
            return nameB.localeCompare(nameA);
        }
    });

    var newSortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
    sortButton.setAttribute('data-sort', newSortDirection);
    
    sortButton.innerHTML = 'Сортирай по име ' + (newSortDirection === 'asc' ? '▲' : '▼');

    rows.forEach(row => table.appendChild(row));
}
