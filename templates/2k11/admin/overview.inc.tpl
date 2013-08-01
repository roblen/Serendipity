    <h2>{$CONST.WELCOME_BACK} {$username|escape:"html"}</h2>
{$backend_frontpage_display}
    <div id="dashboard" class="clearfix">
    {if $update}
        <section id="dashboard_update">
            <h3>Update notification</h3> {* i18n *}

            <span class="msg_notice"><span class="icon-info-circled"></span> New stable Serendipity version available: {$curVersion}</span>
        </section>
    {/if}
    {if is_array($comments)}
        <section id="dashboard_comments" class="equal_heights quick_list">
            <h3>{$CONST.COMMENTS}</h3>

            <ol class="plainList">
            {foreach $comments as $comment}
                <li><div class="comment_summary">
                        <b>#{$comment.id}</b> – {$comment.body|truncate:100:"&hellip;"}
                    </div>
                    
                    <ul class="plainList actions">
                    {if ($comment.status == 'pending') || ($comment.status == 'confirm')}
                        <li><a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=comments&amp;serendipity[adminAction]=approve&amp;serendipity[id]={$comment.id}&amp;{$token}" title="{$CONST.APPROVE}"><span class="icon-lock-open"></span><span class="visuallyhidden">{$CONST.APPROVE}</span></a></li>
                    {/if}
                    {if ($comment.status == 'approved')}
                        <li><a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=comments&amp;serendipity[adminAction]=pending&amp;serendipity[id]={$comment.id}&amp;{$token}" title="{$CONST.SET_TO_MODERATED}"><span class="icon-lock"></span><span class="visuallyhidden"> {$CONST.SET_TO_MODERATED}</span></a></li>
                    {/if}
                    {if $comment.excerpt}
                        <li><a class="button_link toggle_comment_full" href="#c{$comment.id}_full" title="{$CONST.TOGGLE_ALL}"><span class="icon-plus"></span><span class="visuallyhidden"> {$CONST.TOGGLE_ALL}</span></a></li>
                    {/if}
                        <li><a class="button_link" href="{$comment.entrylink}" title="{$CONST.VIEW}"><span class="icon-zoom-in"></span><span class="visuallyhidden"> {$CONST.VIEW}</span></a></li>
                        <li><a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=comments&amp;serendipity[adminAction]=edit&amp;serendipity[id]={$comment.id}&amp;serendipity[entry_id]={$comment.entry_id}&amp;{$token}" title="{$CONST.EDIT}"><span class="icon-edit"></span><span class="visuallyhidden"> {$CONST.EDIT}</span></a></li>
                        <li><a class="button_link comments_delete" href="?serendipity[action]=admin&amp;serendipity[adminModule]=comments&amp;serendipity[adminAction]=delete&amp;serendipity[id]={$comment.id}&amp;serendipity[entry_id]={$comment.entry_id}&amp;{$token}" data-delmsg='{($CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author)|escape}' title="{$CONST.DELETE}"><span class="icon-trash"></span><span class="visuallyhidden"> {$CONST.DELETE}</span></a></li>
                        <li><a class="button_link comments_reply" href="?serendipity[action]=admin&amp;serendipity[adminModule]=comments&amp;serendipity[adminAction]=reply&amp;serendipity[id]={$comment.id}&amp;serendipity[entry_id]={$comment.entry_id}&amp;serendipity[noBanner]=true&amp;serendipity[noSidebar]=true&amp;{$token}" title="{$CONST.REPLY}"><span class="icon-chat"></span><span class="visuallyhidden"> {$CONST.REPLY}</span></a></li>
                    </ul>
                </li>
            {/foreach}
            </ol>
        </section>
    {/if}
    {if is_array($entries)}
        <section id="dashboard_entries" class="equal_heights quick_list">
            <h3>{$CONST.ADMIN_ENTRIES}</h3> {* i18n *}

            <ol class="plainList">
            {foreach $entries as $entry}
                <li class="clearfix">
                    <a href="?serendipity[action]=admin&amp;serendipity[adminModule]=entries&amp;serendipity[adminAction]=edit&amp;serendipity[id]={$entry.id}" title="#{$entry.id}: {$entry.title|escape}">{$entry.title}</a>
                    <ul class="plainList actions">
                        <li><a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=entries&amp;serendipity[adminAction]=preview&amp;{$token}&amp;serendipity[id]={$entry.id}" title="{$CONST.PREVIEW} #{$entry.id}"><span class="icon-zoom-in"></span><span class="visuallyhidden"> {$CONST.PREVIEW}</span></a></li>
                        <li><a class="button_link" href="?serendipity[action]=admin&amp;serendipity[adminModule]=entries&amp;serendipity[adminAction]=edit&amp;serendipity[id]={$entry.id}" title="{$CONST.EDIT} #{$entry.id}"><span class="icon-edit"></span><span class="visuallyhidden"> {$CONST.EDIT}</span></a></li>
                    </ul>
                {if !$showFutureEntries && ($entry.timestamp >= $serverOffsetHour) && $entry.isdraft == "false"}
                    <span class="entry_status status_future">{$CONST.ENTRY_PUBLISHED_FUTURE}</span>
                {/if}
                {if $entry.isdraft == "true"}
                    <span class="entry_status status_draft">Draft</span>
                {/if}
                </li>
            {/foreach}
            </ol>
        </section>
    {/if}
        <section id="further_links">
            <h3 class="collapsed"><a href="#s9y_links" class="toggle_links"><span class="icon-plus"></span> {$CONST.FURTHER_LINKS}</a></h3>

            <div id="s9y_links" class="additional_info">
                <ul class="clearfix plainList">
                    <li><a href="http://www.s9y.org/">{$CONST.FURTHER_LINKS_S9Y}</a></li>
                    <li><a href="http://www.s9y.org/33.html">{$CONST.FURTHER_LINKS_S9Y_DOCS}</a></li>
                    <li><a href="http://blog.s9y.org/">{$CONST.FURTHER_LINKS_S9Y_BLOG}</a></li>
                    <li><a href="http://www.s9y.org/forums/">{$CONST.FURTHER_LINKS_S9Y_FORUMS}</a></li>
                    <li><a href="http://spartacus.s9y.org/">{$CONST.FURTHER_LINKS_S9Y_SPARTACUS}</a></li>
                    <li><a class="s9y_bookmarklet" href="{$bookmarklet}" title="{$CONST.FURTHER_LINKS_S9Y_BOOKMARKLET_DESC}">{$CONST.FURTHER_LINKS_S9Y_BOOKMARKLET}</a></li>
                </ul>
            </div>
        </section>
    </div>
    <script src="{serendipity_getFile file='admin/js/jquery.syncheight.js'}"></script>
    <script src="{serendipity_getFile file='admin/js/jquery.magnific-popup.js'}"></script>
