<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title float-left">Catatan</h4>
                <div class="d-inline ml-auto float-right">
                    <a href="#" class="btn btn-success btn-sm btn-add-catatan" data-toggle="modal" data-target="#modal-add-catatan"><i class="fa fa-plus"></i> Tambah Catatan</a>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <th>No.</th>
                            <th>Catatan</th>
                            <th>Aksi</th>
                        </thead>
                        <tbody id="tbody-catatan">
                            <?php foreach ($catatan as $i => $d) : ?>
                                <tr id="<?= 'catatan-' . $d->id_catatan ?>">
                                    <td><?= ($i + 1) ?></td>
                                    <td class="nama-catatan"><?= $d->nama_catatan ?></td>
                                    <td>
                                        <a href="#" class="btn btn-primary btn-sm btn-edit-catatan" data-toggle="modal" data-target="#modal-edit-catatan" data-catatan="<?= base64_encode(json_encode($d)) ?>"><i class="fa fa-edit"></i> Edit</a>
                                        <a href="<?= base_url('catatan/destroy/' . $d->id_catatan) ?>" class="btn btn-danger btn-sm btn-delete ml-2" onclick="return false"><i class="fa fa-trash"></i> Hapus</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-add-catatan" tabindex="-1" role="dialog" aria-labelledby="modal-add-catatan-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="form-add-catatan" action="<?= base_url('catatan/store') ?>" method="post" onsubmit="return false">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-add-catatan-label">Tambah Catatan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nama-catatan">Catatan :</label>
                        <input type="text" name="nama_catatan" id="nama-catatan" class="form-control" placeholder="Catatan" required="reuired" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-edit-catatan" tabindex="-1" role="dialog" aria-labelledby="modal-edit-catatan-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="form-edit-catatan" action="<?= base_url('catatan/update') ?>" method="post" onsubmit="return false">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-edit-catatan-label">Edit Catatan</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="edit-nama-catatan">Catatan :</label>
                        <input type="hidden" name="id_catatan" id="edit-id-catatan">
                        <input type="text" name="nama_catatan" id="edit-nama-catatan" class="form-control" placeholder="Catatan" required="reuired" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>