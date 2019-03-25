import React, { useState } from "react";

//styles
import { Header, HeaderItem, TabContent } from "./style";

export default function Tab(props) {
  const [activeTabId, setActiveTabId] = useState(1);
  return (
    <>
      <Header>
        {props.children.map(t => (
          <HeaderItem
            key={t.props.tabId}
            onClick={() => setActiveTabId(t.props.tabId)}
            isActive={t.props.tabId === activeTabId}
          >
            {t.props.label}
          </HeaderItem>
        ))}
      </Header>

      <TabContent>
        {props.children.map(t => {
          if (t.props.tabId !== activeTabId) {
            return undefined;
          }
          return t.props.children;
        })}
      </TabContent>
    </>
  );
}
