function delete_recursive( line )
%DELETE_RECURSIVE( LINE )  Delete line if:
%   1) do not have any source-block
%   2) do not have any line-children AND no destination-block
%   otherwise go recursively through all eventual line-children

if get( line, 'SrcPortHandle' ) < 0
    delete_line( line ) ;
    return
end
LineChildren = get( line, 'LineChildren' ) ;
if isempty( LineChildren )
    if get( line, 'DstPortHandle' ) < 0
        delete_line( line ) ;
    end
else
    for i=1:length( LineChildren )
        delete_recursive( LineChildren( i ) )
    end
end